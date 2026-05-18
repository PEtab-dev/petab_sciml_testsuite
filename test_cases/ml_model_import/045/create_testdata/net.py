"""Neural network import test generation"""

import torch
import torch.nn as nn
from pysrc.ml_import_helper import make_yaml, test_nn


class Net(nn.Module):
    def __init__(self) -> None:
        super().__init__()
        self.norm1 = nn.BatchNorm3d(3)
        self.norm2 = nn.BatchNorm3d(4)
        self.layer1 = nn.Conv3d(3, 4, 5)
        self.layer2 = nn.Conv3d(4, 1, 5)

    def forward(self, net_input: torch.Tensor) -> torch.Tensor:
        x = self.norm1(net_input)
        x = self.layer1(x)
        x = self.norm2(x)
        x = self.layer2(x)
        return x


def ml_model_import_045(dir_save):
    net = Net()
    make_yaml(net, dir_save)
    test_nn(net, dir_save, ["layer1", "layer2", "norm1", "norm2"])
    return 0
